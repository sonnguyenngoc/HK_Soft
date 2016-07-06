Rails.application.routes.draw do
  get 'contact/index'

  get 'service/index'

  devise_for :users
  
  scope "(:locale)", locale: /vi|en/, defaults: {locale: "vi"} do
    
    # Trang chủ
    root "home#index"
    
    # Giới thiệu
    get "gioi-thieu.html" => "about_us#index", as: :about_us
    
    # Tour du lịch
    get "tour-du-lich.html" => "tour#index", as: :tour
    get "tour-du-lich/tour-trong-nuoc.html" => "tour#domestic_tour", as: :domestic_tour
    get "tour-du-lich/tour-nuoc-ngoai.html" => "tour#foreign_tour", as: :foreign_tour
    get "tour-du-lich/tour-trong-nuoc/cac-goi-tour-du-lich.html" => "tour#tour_packages", as: :tour_packages
    get "tour-du-lich/tour-trong-nuoc/cac-goi-tour-du-lich/chi-tiet-tour-du-lich.html" => "tour#tour_detail", as: :tour_detail
    get "tour-du-lich/tour-trong-nuoc/cac-goi-tour-du-lich/chi-tiet-tour-du-lich/dat-tour.html" => "tour#tour_booking", as: :tour_booking
    
    # Tổ chức sự kiện
    get "to-chuc-su-kien.html" => "event#index", as: :event
    get "to-chuc-su-kien/to-chuc-team-building.html" => "event#event_listing", as: :event_listing
    get "to-chuc-su-kien/to-chuc-team-building/chi-tiet.html" => "event#event_detail", as: :event_detail
    
    # Dịch vụ
    get "dich-vu.html" => "service#index", as: :service
        
    # Thuê xe du lịch
    get "dich-vu/thue-xe-du-lich.html" => "car_hire#index", as: :car_hire
    get "dich-vu/thue-xe-du-lich/hien-thi-dang-o.html" => "car_hire#car_grid_view", as: :car_grid_view
    get "dich-vu/thue-xe-du-lich/chi-tiet-xe.html" => "car_hire#car_detail", as: :car_detail
    get "dich-vu/thue-xe-du-lich/chi-tiet-xe/dat-xe.html" => "car_hire#car_booking", as: :car_booking
    get "dich-vu/thue-xe-du-lich/chi-tiet-xe/dat-xe/cam-on.html" => "car_hire#car_thankyou", as: :car_thankyou
  
    # Khách sạn
    get "dich-vu/khach-san.html" => "book_hotel#index", as: :hotel_listing
    get "dich-vu/khach-san/chi-tiet-khach-san.html" => "book_hotel#book_hotel_detail", as: :book_hotel_detail
    get "dich-vu/khach-san/chi-tiet-khach-san/dat-phong.html" => "book_hotel#hotel_booking", as: :hotel_booking
    get "dich-vu/khach-san/chi-tiet-khach-san/dat-phong/thanh-cong-:booking_hotel_id.html" => "book_hotel#hotel_thankyou", as: :hotel_thankyou
    post "slideshow-popup.html" => "book_hotel#slideshow_popup", as: :slideshow_popup
  
    # Cẩm nang du lịch
    get "cam-nang-du-lich.html" => "tour_handbook#index", as: :tour_handbook
    get "cam-nang-du-lich/kham-pha.html" => "tour_handbook#tour_handbook_sub_1", as: :tour_handbook_sub_1
    get "cam-nang-du-lich/kham-pha/an-giang.html" => "tour_handbook#tour_handbook_sub_2", as: :tour_handbook_sub_2
    get "cam-nang-du-lich/kham-pha/an-giang/chi-tiet-cam-nang-du-lich.html" => "tour_handbook#tour_handbook_detail", as: :tour_handbook_detail
  
    # Tin tức du lịch
    get "tin-tuc-du-lich.html" => "travel_news#index", as: :travel_news
    get "tin-tuc-du-lich/(:title)-:travel_news_id.html" => "travel_news#travel_news_detail", as: :travel_news_detail
  
    # Bảng giá tour
    # Tin từ công ty
    get "chinh-sach-thanh-toan.html" => "info#info_sub_1", as: :info_sub_1
    get "chinh-sach-doi-tra-voucher-va-hoan-tien.html" => "info#info_sub_2", as: :info_sub_2
    get "chinh-sach-bao-mat-thong-tin-khach-hang.html" => "info#info_sub_3", as: :info_sub_3
    get "chinh-sach-giai-quyet-tranh-chap-khieu-nai.html" => "info#info_sub_4", as: :info_sub_4
    get "dieu-khoan-mua-ban-hang-hoa.html" => "info#info_sub_5", as: :info_sub_5
    
    get "lien-he.html" => "contact#index", as: :contact
    get "lien-he/gui-thanh-cong.html" => "contact#contact_thankyou", as: :contact_thankyou
    
    # booking
    resources :booking_hotels
    resources :booking_cars
    resources :contacts
    
    namespace :admin, path: "quan-tri" do
      get "/" => "main#index"
      scope(:path_names => { :new => "tao-moi", :edit => "chinh-sua" }) do
        resources :shopping_carts, path: "gio-hang"
        resources :products, path: "danh-sach-san-pham" do
          collection do
            get 'search'
            get 'search_backend'
            get 'approve'
            get 'add_related_articles'
          end
        end
        resources :categories, path: "chuyen-muc-san-pham" do
          collection do
            get 'search'
            get 'update_parent_order'
            get 'three_cols_select'
          end
        end
        resources :manufacturers, path: "nha-cung-cap" do
          collection do
            get 'search'
          end
        end
        resources :articles, path: "bai-viet" do
          collection do
            get 'search'
            post 'upload_image_video'
            get 'approve'
            get 'add_related_products'
          end
        end
        resources :article_categories, path: "chuyen-muc-bai-viet" do
          collection do
            get 'search'
          end
        end
        resources :areas, path: "khu-vuc" do
          collection do
            get 'search'
          end
        end
        resources :orders, path: "don-hang" do
          collection do
            get 'search'
          end
          collection do
            get 'pending'
          end
          collection do
            get 'finish'
          end
          collection do
            get 'cancel'
          end
        end
        resources :newsletters, path: "dang-ky-nhan-tin-moi" do
          collection do
            get 'search'
          end
        end
        resources :contacts, path: "lien-he" do
          collection do
            get 'search'
          end
        end
        resources :wish_lists, path: "san-pham-yeu-thich" do
          collection do
            get 'search'
          end
        end
        resources :comments, path: "binh-luan-san-pham" do
          collection do
            get 'search'
          end
        end
        resources :users , path: "nguoi-dung" do
          collection do
            get 'search'
          end
        end
        resources :questions, path: "cau-hoi-san-pham" do
          collection do
            get 'search'
          end
        end
        resources :customers, path: "khach-hang" do
          collection do
            get 'search'
          end
        end
        resources :payment_methods, path: "hinh-thuc-thanh-toan" do
          collection do
            get 'search'
          end
        end
        resources :delivery_methods, path: "hinh-thuc-giao-hang" do
          collection do
            get 'search'
          end
        end
        resources :comment_articles, path: "binh-luan-bai-viet" do
          collection do
            get 'search'
          end
        end
        resources :slideshows, path: "trinh-chieu" do
          collection do
            get 'search'
          end
        end
        resources :vouchers, path: "phieu-mua-hang" do
          collection do
            get 'search'
          end
        end
        resources :coupons, path: "ma-giam-gia" do
          collection do
            get 'search'
          end
        end
        resources :testimonials, path: "y-kien-khach-hang" do
          collection do
            get 'search'
          end
        end
        resources :tours, path: "tour-du-lich" do
          collection do
            get 'approve'
          end
        end
        resources :hotels
        resources :cars
        resources :booking_hotels
        resources :booking_cars
        resources :companies, path: "chi-nhanh"
        resources :user_groups, path: "nhom-nguoi-dung"
        get "tru-so-chinh" => "companies#head_office", as: :head_office
        resources :options, path: "cai-dat"
        resources :code_statuses, path: "ma-bai-viet" do
          collection do
            get 'search'
          end
        end
      end
    end
  end
end
