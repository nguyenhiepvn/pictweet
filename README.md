# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* NOTE 
1. <span><%= image_tag 'arrow_top.png' %></span>
=> <span><img src="assets/arrow_top.png" /></span>

2. rails routes if you run a command in the terminal to find valid routes
after use 
 <%= link_to "link_button", '/', class: "header__title--text" %>

3. before_action :set_tweet, only: [:edit, :show]
4. Create a migration file to add a nickname column of type string to the users table
    ->rails g migration AddNicknameToUsers nickname:string # Run the migration you created 
5. before_action
   trong controller là một callback function  nó giúp chạy phương thức configure_permitted_parametes trước bất kỳ phương thức nào khác trong controller
6. has_many tweets
 ý ở đây đang nói tới bảng tweets chứ không phải model, thế cx hợp lý mà tại vì 1 user có nhiều bài đăng là đang ý nói tới 1 user trong table có nhiều bài đăng trong table tweets
7. belongs_to  
  belongs_to :user
  validates :user_id presence: true ←不要
includes(:user): Phương thức includes được gọi trên model Tweet để chỉ định rằng bạn muốn tải dữ liệu của các đối tượng tweet cùng với thông tin liên quan từ model User.
8. xóa thuộc tính của table bằng câu lệnh trên rails 
   rails g migration RemoveNameFromTweets name:string
9. Lệnh pwd trong hệ điều hành Linux và macOS là viết tắt của "print working directory" (in thư mục làm việc). Lệnh này hiển thị đường dẫn đầy đủ của thư mục hiện tại mà bạn đang làm việc.
10. Rails db:merge:reset は、データベースを元の状態に「リセット」する Rails のコマンドです。
11. sau khi cài đặt các gem thì các gem nãy sẽ được cài đặt trên máy tính(server của bạn)
         để kiểm tra thông tin coi gem đó được cài đặt ở đâu thì có thể dùng lệnh 
         bundle info + tên gem *faker
12.
  FactoryBot
    FactoryBot.build tạo ra đối tượng giả mà không lưu vào database
    FactoryBot.define do: Khối lệnh này khởi tạo một khối định nghĩa factory cho FactoryBot.
    factory :user do: Đây là nơi bạn định nghĩa factory cho model User.
    :user là tên của factory.
    Khối lệnh do ... end bao gồm các thuộc tính và giá trị mặc định cho factory này.
    Sau khi định nghĩa factory user, bạn có thể sử dụng nó để tạo ra các đối tượng giả bằng FactoryBot.build hoặc FactoryBot.create
13. 
    Devise tự động kiểm tra định dạng email thông qua module :validatable. Khi bạn sử dụng module này, Devise sẽ thêm các xác thực sau cho email:

    Kiểm tra tính hiện diện của email (presence).
    Kiểm tra tính duy nhất của email (uniqueness).
    Kiểm tra định dạng của email (format).
    Tuy nhiên, nếu bạn muốn tùy chỉnh thông báo lỗi hoặc các xác thực cụ thể hơn, bạn có thể cần phải ghi đè các xác thực mặc định của Devise.

14. cài đặt đặt để sử dụng các file trong support folder
uncomment line dưới
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
sau đó nếu muốn dùng modul nào trong thư mục support thì include vào trong rails_heper thôi


Let's install the library
1.gem 'devise'

  Devise là một công cụ mạnh mẽ giúp đơn giản hóa quá trình thêm các tính năng xác thực người dùng vào ứng dụng Rails. 
  Đăng ký và đăng nhập người dùng:
  Quản lý mật khẩu:
  Xác nhận và khóa tài khoản:
  Quản lý phiên làm việc:

  configuration
     1.Create a devise configuration file -> rails g devise:install
          config/initializers/devise.rb: File này là một initializer cho gem Devise. Devise là một gem cung cấp chức năng xác thực người dùng (authentication) cho ứng dụng Rails. File initializer này cho phép bạn cấu hình các tùy chọn của Devise, chẳng hạn như loại xác thực, chiến lược xác thực, các mô hình người dùng, v.v.
          config/locales/devise.en.yml: File này chứa các bản dịch tiếng Anh cho các thông báo và văn bản liên quan đến Devise. Nó cho phép bạn tùy chỉnh cách Devise hiển thị thông báo cho người dùng, ví dụ như thông báo đăng nhập, đăng ký, xác minh tài khoản, v.v.

     2.Create a User model with the devise command -> rails g devise user
              1. invoke active_record
              Invoke: Từ khóa chỉ ra rằng lệnh rails generate sẽ gọi một generator.
              active_record: Generator này sẽ tạo các file liên quan đến Active Record, framework quản lý cơ sở dữ liệu trong Rails.
              2. create db/migrate/20240611015557_devise_create_users.rb
              create: Từ khóa này chỉ ra rằng một file mới được tạo.
              db/migrate/20240611015557_devise_create_users.rb: Tên file migration, bao gồm đường dẫn và thời gian tạo file. File này chứa các code để tạo bảng users trong cơ sở dữ liệu của bạn.
              3. create app/models/user.rb
              nếu như trong trường hợp đã có model user rồi nó sẽ insert các thông tin vào trong đó 
              create: Tạo một file mới.
              app/models/user.rb: Tên file model, chứa định nghĩa model User trong Rails. Model User đại diện cho thông tin của người dùng trong ứng dụng.
              4. invoke rspec
              invoke: Gọi generator cho framework testing RSpec.
              5. create spec/models/user_spec.rb
              create: Tạo một file mới.
              spec/models/user_spec.rb: Tên file test cho model User. File này sẽ chứa các test case để kiểm tra chức năng của model User.
              6. invoke factory_bot
              invoke: Gọi generator cho library Factory Bot, dùng để tạo dữ liệu giả (fixtures) cho các test case.
              7. create spec/factories/users.rb
              create: Tạo một file mới.
              spec/factories/users.rb: Tên file chứa các định nghĩa factory cho model User. Factory Bot sẽ sử dụng các định nghĩa này để tạo dữ liệu giả cho các test case.
              8. insert app/models/user.rb
              insert: Thêm nội dung vào file app/models/user.rb. Nội dung được thêm vào sẽ liên quan đến việc kết nối model User với Devise.
              9. route devise_for :users
              route: Lệnh này sẽ thêm các route cần thiết cho Devise để xử lý các chức năng đăng nhập, đăng ký, v.v.
              devise_for :users: Chỉ định rằng các route sẽ được tạo cho model User.

            Ví dụ chi tiết cho từng controller khi sử dụng devise_parameter_sanitizer

            SessionsController
            sign_in:
            devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :remember_me])

            RegistrationsController
            sign_up:
            devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name])

            account_update:
            devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :first_name, :last_name])

            PasswordsController
            password_reset:
            devise_parameter_sanitizer.permit(:password_reset, keys: [:email])

            ConfirmationsController
            email_confirmation:
            devise_parameter_sanitizer.permit(:email_confirmation, keys: [:confirmation_token])

            UnlocksController
            account_unlock:
            devise_parameter_sanitizer.permit(:account_unlock, keys: [:unlock_token])

            OmniauthCallbacksController
            callback từ các dịch vụ Omniauth (ví dụ: facebook):
            devise_parameter_sanitizer.permit(:facebook, keys: [:uid, :info, :credentials])

     3. Use the devise command to generate view files for devise. -> rails g devise:views
  how to custom controller 
     khi sử dụng gem Devise trong Ruby on Rails, DeviseController không được tạo sẵn như một file trong dự án của bạn. Thay vào đó, nó được định nghĩa và xử lý bên trong gem Devise. Để tùy chỉnh các hành vi của Devise, bạn có thể ghi đè các controller mặc định của nó.
     Tạo một controller mới:
     class Users::RegistrationsController < Devise::RegistrationsController
     # Your customizations here

              Rails.application.routes.draw do
            devise_for :users, controllers: {
              registrations: 'users/registrations'
            }
          end

          devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])

      end
2.Install RSpec
  2.1 gem 'rspec-rails', '~> 4.0.0' sẽ để bên trong của của development và test tại sẽ trong môi trường develop và test cái gem này sẽ thực thi

      rails g rspec:install là lệnh trong Rails để cài đặt RSpec cho dự án của bạn
      thường bổ sung thêm  --format documentation in .rspec can view content of discrise or it method in mode_spec.rb

      phân loại kiểm thử
          1.kiểm thử model
            rails g rspec:model tweet
            khi tạo kiểm thử model thì chắc chắn cần tới file thực thi test và model cho test nên khi đó 
              file thực thi test-> tạo file model spec
              model cho test  -> tạo file cho các model trong factories 
              nhưng không nhất thiết model thật từ trong app/model là cứ phải tạo model cho nó ví dụ  như comment thì nó không cần tạo model mà chỉ cần fake nội dung 
          2.kiểm thử controller 
            rails generate rspec:controller Tweets
          3.kiể thử request 
          4.kiểm thử system 
              khi system testing thì cần cài đặt thêm gem 'capybara', '>= 2.15'
              câu lệnh tạo file rails g rspec:system users
              khi kiểm thử tự động trên cần phải mở trình duyệt chứ mà trên ubuntu cần phải cài đặt trình duyệt web thì mới dùng đc chứ 
                    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
                    sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
                    sudo apt-get update
                    sudo apt-get install google-chrome-stable language-pack-ja japan*

                    If you are using the latest version of Chrome, you Selenium::WebDriver::Error::UnknownError: unknown error: Cannot construct KeyEvent from non-typeable keymay get the following error. In that case, please do the following:
                    spec/support/capybara_config.rbCreate a Capybara configuration file called
                    capybara_config.rbPut it in the following 
                    require 'webdrivers/chromedriver'
                            Webdrivers::Chromedriver.required_version = '97.0.4692.71'
  các gem khác kết hợp để tạo testcase
  2.2 install FactoryBot 
      gem 'factory_bot_rails'
      dùng để tạo ra model cho việc kiểm thử
  2.3 install Faker
         gem 'faker' dùng để tạo ra thông tin mẫu cho model 


3.GITLAB

ERROR : 
    remote: HTTP Basic: Access denied. The provided password or token is incorrect or your account has 2FA enabled and you must use a personal access token instead of a password. See https://gitlab.com/help/topics/git/troubleshooting_git#error-on-git-fetch-http-basic-access-denied
    fatal: Authentication failed for 'https://gitlab.com/HiepNguyensekisho/pictweet.git/'
SOLUTION 
Project Access Tokens in gitlab 
Nguyen Hiep glpat-9QLsXS2J-g_xxM4an31b
git remote set-url origin https://<your-username>:<your-access-token>@gitlab.com/HiepNguyensekisho/pictweet.git

git remote set-url pictweet https://Nguyen%20Hiep:glpat-CSDuiPYsx_f3uhL8rFQYV@gitlab.com/HiepNguyensekisho/pictweet.git

git remote -v
  pictweet        https://gitlab.com/HiepNguyensekisho/pictweet.git (fetch)
  pictweet        https://gitlab.com/HiepNguyensekisho/pictweet.git (push)

----> git remote set-url pictweet https://HiepNguyensekisho:glpat-VU6hjq5XDFkpBbNt9mfz@gitlab.com/HiepNguyensekisho/pictweet.git
  tìm user name của gitlab ở account > change username 

glpat-VU6hjq5XDFkpBbNt9mfz


    KHI SỬ DỤNG
     I.Layouts and Rendering in Rails
       1/ Partial templates
         khi truyền 1 biến instance từ controller sang view sau đó muốn truyền biến đó sang một partial template thì ở view template vẫn là biến instance(có ký tự @) còn trong partial nó chỉ là biến local (tức là chỉ có khả năng sử dụng trong phạm vi partial đó)
        ...
      2.
### create model and migration 
 ## users
 rails generate model Users email:string:uniq encrypted_password:string name:string profile:text occupation:text position:text  
 ## prototypes
 rails generate model Prototypes title:string catch_copy:text concept:text 
 ## comments
  rails generate model Comments content:text 
 ## note
  t.references :model_name, options
  has_many :associated_models, options