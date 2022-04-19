#### UNIT TEST

* Là test ở mức đơn vị nhỏ nhất là function. Ngoài ra class, interface, usecase cũng có thể coi là đơn vị.

* Unit test chỉ test các logic của đơn vị thực hiện test mà không bao gồm việc test cho các dependancy khác như database, external service.

* Unit test không cần môi trường test.
* Unit test quan tâm đến detail của logic.
* Các dependancy của unit test thường được dùng Test-double.

---------------

#### INTEGRATION TEST

* Là cách test sự tương tác giữa các component với nhau, với các external dependancy như database hoặc external service.
=> chính xác và thực tế hơn.
* Hỗ trợ catch được các lỗi cơ bản trong 1 flow của chương trình.
* Không quan tâm đến hoạt động của component mà chỉ xác nhận kết quản cuối cùng có đúng không.

Ở cách test này, ta sẽ có khái niệm Test-Double để tương tác với các object bên trong và ngoài hệ thống.
Người ta không khuyến khích test với các object thật.

##### Chuẩn bị database cho Integration test:
Có nhiều cách như:  cài đặt 1 local database, dùng in-memory database (1 dạng database lưu trữ trên memory và có interface tương ứng với các loại db khác, VD như h2 tương ứng với MySQL), embedded database hoặc docker container.

Ở đây ta nêu 2 cách phổ biến:

* C1: Embedded Database có API tương thích với loại hệ quản trị csdl như MySQL (https://github.com/wix/wix-embedded-mysql)

```
public static void initEmbeddedMysql() {
    if (mysqld != null) {
        return;
    }

    MysqldConfig config = MysqldConfig.aMysqldConfig(Version.v5_7_latest)
            .withPort(3309)
            .withUser("unit_test", "12345678")
            .withTimeZone("Asia/Ho_Chi_Minh")
            .build();

    mysqld = EmbeddedMysql.anEmbeddedMysql(config)
            .addSchema("catalogdb", ScriptResolver.classPathScript("v3.sql"))
            .start();
}
```
Sau khi điền các thông tin đăng nhập vào.
Ở chỗ ``classPathScript("file.sql")`` ta sẽ import schema của table database vào.


* C2: TestContainer sử dụng Docker engine để dựng các container cần thiết.

=> Dễ set up, hỗ trợ nhiều db MySql-Postgres và kể cả queue (Kafka). Cần set up docker engine ở local hoặc trên server của bạn.

```
@Testcontainers
public class IntegrationTest {
    @Container
    protected static final MySQLContainer<?> mysql = new MySQLContainer<>("mysql:5.7")
            .withDatabaseName("catalog_db")
            .withUsername("root")
            .withPassword("12345678")
            .withConfigurationOverride("conf.d")
            .withCopyFileToContainer(MountableFile.forClasspathResource("db/schema.sql"), "/docker-entrypoint-initdb.d/schema.sql");

    @Container
    protected static final KafkaContainer kafka = new KafkaContainer(DockerImageName.parse("confluentinc/cp-kafka:6.2.1"));
}
```

------------------

#### TEST-DOUBLE

Đây là khái niệm thay thế các real component thành các cascadeur (thế thân).

Gồm:

1) Fake : là object có thể hoạt động giống như real dependency nhưng theo cách đơn giản như một in-memory storage thay vì database real) miễn sao ``To make it through``.

```
public class FakeAuthService implements AuthService {
    /**
     * Check given user is authenticated or not?
     */
    public boolean isAuthenticated(User user) {
        if (user.isActive()) {
            return true; // fake logic: always return true if user is active
        }

        return false;
    }
}
```
=> Ví dụ trên cài đặt cho phần authentication auto pass khi mà user isActive() thay vì đưa vào các code check chiết như real code. Do muốn test flow connect các component.


2) Stub:
Là object chứa data được defined trước để handle các request khi có yêu cầu, hỗ trợ quá trình chạy test chính xác hơn.

3) Mock:
Là object giúp kiểm tra được hành vi của component nhất là các object gọi đến database hoặc các external service để update.

### Config CI/CD cho unitest:

```
jobs:
  unittest:
    docker:
      - image:
          name: '{{ .env.BUILD_IMAGE }}'
    steps:
      - run:
          name: 'Test command'
          command: 'mvn test'
  build:
    ......
workflows:
  jenkins_pipeline:
    jobs:
      - unittest
      - build:
          requires:
            - unittest
      - build_docker:
          ......        
```  

* jobs: phần này cấu hình cho từng bước 
* workflow: thứ tự các jobs thực hiện từ trên xuống dưới.
* requires: nếu bước này fail thì hệ thống sẽ từ chối thực hiện bước tiếp theo, đây là tùy chọn.