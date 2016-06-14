Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /vi|en/, defaults: {locale: "vi"} do
    
    # home page
    root "home#index"
    
    # hosting pages
    get "hosting-1" => "hosting1#index", as: :hosting1
    get "hosting-2" => "hosting2#index", as: :hosting2
    get "hosting-3" => "hosting3#index", as: :hosting3
    get "hosting-4" => "hosting4#index", as: :hosting4
    get "hosting-5" => "hosting5#index", as: :hosting5
    get "hosting-6" => "hosting6#index", as: :hosting6
    
    # domains page
    get "domains" => "domains#index", as: :domains
    
    # PAGES
    
        # about us page
        get "about-us" => "about_us#index", as: :about_us

        # servies page
        get "services" => "services#index", as: :services

        # our team page
        get "our-team" => "our_team#index", as: :our_team

        # left sidebar page
        get "left-sidebar" => "left_sidebar#index", as: :left_sidebar

        # right sidebar page
        get "right-sidebar" => "right_sidebar#index", as: :right_sidebar
        
        # left navigation page
        get "left-nav" => "left_nav#index", as: :left_nav
        
        # right navigation page
        get "right-navigation" => "right_nav#index", as: :right_nav

        # faq page
        get "faq" => "faq#index", as: :faq

        # video background page
        get "video-bg" => "video_bg#index", as: :video_bg
        
        # coming soon page
        get "coming-soon" => "coming_soon#index", as: :coming_soon

        # history  timeline page
        get "history" => "history#index", as: :history

        # login page
        get "login" => "login#index", as: :login

        # register page
        get "register" => "register#index", as: :register

        # error page
        get "error-page" => "error_page#index", as: :error_page
    
    # END PAGES
    
    # blog pages
    get "blog-1" => "blog1#index", as: :blog1
    get "blog-2" => "blog2#index", as: :blog2
    get "blog-3" => "blog3#index", as: :blog3
    get "blog-post" => "blog_post#index", as: :blog_post
    
    # support page
    get "support" => "support#index", as: :support
    
    # contact pages
    get "contact" => "contact#index", as: :contact
    get "contact-2" => "contact2#index", as: :contact2
    get "contact-3" => "contact3#index", as: :contact3
    
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
