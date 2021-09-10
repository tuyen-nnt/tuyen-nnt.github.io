Các bước set-up:
https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html


* Lỗi khi run database migrations and create the first user account:
``docker-compose up airflow-init``


https://github.com/Mailu/Mailu/issues/853
> Do docker-compose chưa update

Kết quả:

DB_HOST=postgres
DB_PORT=5432
DB: postgresql+psycopg2://airflow:***@postgres/airflow



* Sau khi ``docker-compose up``:

Success. You can now start the database server using:
``pg_ctl -D /var/lib/postgresql/data -l logfile start``

Build custom image tại :
https://airflow.apache.org/docs/docker-stack/build.html


* Cách tạo và import package trong Python:

Ví dụ trong link là import package ``airflow_operators``. 
https://airflow.apache.org/docs/apache-airflow/stable/modules_management.html


* Thêm thư mục đường dẫn vào ``sys.path``:

VD: PYTHONPATH=/home/arch/projects/airflow_operators python

* Dùng Macros nhưng phải cài Jinja Templating trước:

https://airflow.apache.org/docs/apache-airflow/stable/macros-ref.html

* *Args và **kwargs:

https://realpython.com/python-kwargs-and-args/