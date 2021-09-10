---
layout: post
title:  "Setup Jekyll themes"
author: tuyennnt
categories: [ Git, Blog, Web ]
image: img/jekyll.png
---

## Fork Jekyll theme & Play

Đây là theme blog mình đang sử dụng: https://github.com/tuyen-nnt/jekyll-theme-memoirs

Các bước build Jekyll cho blog này: https://bootstrapstarter.com/jekyll-theme-memoirs/
(Tìm hiểu thêm tại: https://jekyllrb.com/docs/)


* B1: git clone https://github.com/wowthemesnet/jekyll-theme-memoirs.git
* B2: Tải Ruby https://www.ruby-lang.org/en/documentation/installation/
* B3: cd vào thư mục theme rồi ``gem install bundler``
* B4: ``bundle install``

Kết quả build thành công:

![](img/bundle-install.png)

* B5: Sửa lại ``_config.yml`` theo blog của mình
* B6: ``bundle exec jekyll serve --watch``
* B7: Xem web blog tại http://127.0.0.1:4000/jekyll-theme-memoirs (nếu folder vẫn giữ tên cũ)
* B8: Thêm blogs định dạng ``.md`` vào folder ``_posts``. Trước mỗi bài viết sẽ có ô YAML là định dạng chung, bạn chỉ cần điền vào thông tin của mình là được (nhưng vẫn giữ form nhé). Chi tiết xem link các bước thực hiện.


Tìm hiểu về Bundler install: https://bundler.io/

Tìm hiểu về Gemfile: https://bundler.io/gemfile.html

