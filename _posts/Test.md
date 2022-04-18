UNIT TEST

* Là test ở mức đơn vị nhỏ nhất là function. Ngoài ra class, interface, usecase cũng có thể coi là đơn vị.

* Unit test chỉ test các logic của đơn vị thực hiện test mà không bao gồm việc test cho các dependancy khác như database, external service.

* Unit test không cần môi trường test.
* Unit test quan tâm đến detail của logic.
* 
* Các dependancy của unit test thường được dùng Test-double.

INTEGRATION TEST

* Là cách test sự tương tác giữa các component với nhau, với các external dependancy như database hoặc external service.
=> chính xác và thực tế hơn.
* Hỗ trợ catch được các lỗi cơ bản trong 1 flow của chương trình.
* Không quan tâm đến hoạt động của component mà chỉ xác nhận kết quản cuối cùng có đúng không.


Cách config CI/CD cho unitest

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
  