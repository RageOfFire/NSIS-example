# NSIS setup

* Bộ cài hỗ trợ cho NSIS.

![GitHub language count](https://img.shields.io/github/languages/count/RageOfFire/NSIS-example)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/RageOfFire/NSIS-example)
![GitHub last commit](https://img.shields.io/github/last-commit/RageOfFire/NSIS-example)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/RageOfFire/NSIS-example)
![GitHub repo size](https://img.shields.io/github/repo-size/RageOfFire/NSIS-example)
![GitHub followers](https://img.shields.io/github/followers/RageOfFire)
![GitHub Repo stars](https://img.shields.io/github/stars/RageOfFire/NSIS-example)

## Mô tả

NSIS (Nullsoft Scriptable Install System) là một chương trình mã nguồn mở chuyên nghiệp cho người phát triển các ứng dụng cài đặt phần mềm của mình trên Windows. Chương trình được thiết kế mềm dẻo và nhỏ gọn phù hợp với môi trường Internet hiện nay. Một việc triển khai phần mềm của mình làm ra trên máy tính của khách hàng của mình luôn là điều cấp thiết của người phát triển phần mềm. NSIS cho phép bạn tạo một chương trình cài đặt và gỡ bỏ việc cài đặt một cách chắc chắn và ổn định, nhanh chóng, và bạn có thể đưa vào cấu hình một cách dễ dàng theo ý thích của mình.

## Bắt đầu

### Yêu cầu

* cài đặt [NSIS](https://nsis.sourceforge.io/Download)

### Cài đặt

* Đưa tất cả các file ứng dụng của bạn vào folder app (Lưu ý phải có file .exe)
* Mở file setup.nsi thay thế những dòng sau
* Tên ứng dụng của bạn:

```sh
  !define NAME "Tên app của bạn"
```

* Tên file .exe trong foler app:

```sh
  !define APPFILE "File.exe bên trong folder app"
```

* Phiên bản của ứng dụng:

```sh
  !define VERSION "Phiên bản"
```

* Compile file .nsi và hoàn thành

### Tùy chọn

* Thêm LICENSE:
* Bỏ dấu **;** của tùy chọn này và thêm 1 file bản quyền **license.txt** ngay ngoài cùng với file **setup.nsi**

```sh
  ; !insertmacro MUI_PAGE_LICENSE "license.txt"
```

* Thay đổi icon ứng dụng:
* Thêm 1 file hình ảnh với đuôi là **.ico** vào thư mục **assets**
* Thay đổi đoạn code dưới thành:

```sh
  !define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install-colorful.ico"
```

* Như này:

```sh
  !define MUI_ICON "assets\App.ico"
```

* **App.ico** là tên file .ico của bạn
* Tương tự với Icon gỡ cài đặt:

```sh
  !define MUI_UNICON "assets\UninstallApp.ico"
```

* Thay đổi ảnh welcome và header:
* Welcome là 1 ảnh sẽ xuất hiện khi người dùng bắt đầu cài đặt và sẽ xuất hiện bên trái màn hình:

```sh
  !define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\win.bmp"
```

* Bạn có thể tự thay đổi nó bằng 1 ảnh khác với đuôi là **.bmp** đặt vào thư mục **assets**

```sh
  !define MUI_WELCOMEFINISHPAGE_BITMAP "assets\welcome.bmp"
```

* **welcome.bmp** là tên file .bmp của bạn
* Lưu ý: Kích thước của ảnh **welcome.bmp** bắt buộc phải là (164x314) pixels
* Tương tự với header:

```sh
  !define MUI_HEADERIMAGE_BITMAP "assets\header.bmp"
```

* Lưu ý: Kích thước của ảnh **header.bmp** bắt buộc phải là (150x57) pixels

## Hỗ trợ

![GitHub issues](https://img.shields.io/github/issues/RageOfFire/NSIS-example)
![GitHub pull requests](https://img.shields.io/github/issues-pr/RageOfFire/NSIS-example)

## Tác giả

* [RageOfFire](https://github.com/RageOfFire)
