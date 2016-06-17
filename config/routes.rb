Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /vi|en/, defaults: {locale: "en"} do
    
    # home page
    root "home#index"
    
    # servies page
    get "services.html" => "services#index", as: :services
    get "website-development.html" => "services#services_sub_1", as: :services_sub_1
    get "web-based-software-development.html" => "services#services_sub_2", as: :services_sub_2
    get "e-commerce.html" => "services#services_sub_3", as: :services_sub_3
    get "google-apps-for-bussiness.html" => "services#services_sub_4", as: :services_sub_4
    get "outsourcing.html" => "services#services_sub_5", as: :services_sub_5
    get "research-and-development.html" => "services#services_sub_6", as: :services_sub_6
    get "systems-integration.html" => "services#services_sub_7", as: :services_sub_7
    get "email-marketing.html" => "services#services_sub_8", as: :services_sub_8
    
    # hosting pages
    get "hosting-1.html" => "hosting1#index", as: :hosting1
    get "hosting-2.html" => "hosting2#index", as: :hosting2
    get "hosting-3.html" => "hosting3#index", as: :hosting3
    get "hosting-4.html" => "hosting4#index", as: :hosting4
    get "hosting-5.html" => "hosting5#index", as: :hosting5
    get "hosting-6.html" => "hosting6#index", as: :hosting6
    
    # domains page
    get "domains-hosting.html" => "domains#index", as: :domains_hosting
    
    # domains-hosting page
    
    # PAGES
    
        # about us page
        get "about-us.html" => "about_us#index", as: :about_us

        # our team page
        get "our-team.html" => "our_team#index", as: :our_team

        # left sidebar page
        get "left-sidebar.html" => "left_sidebar#index", as: :left_sidebar

        # right sidebar page
        get "right-sidebar.html" => "right_sidebar#index", as: :right_sidebar
        
        # left navigation page
        get "left-nav.html" => "left_nav#index", as: :left_nav
        
        # right navigation page
        get "right-navigation.html" => "right_nav#index", as: :right_nav

        # faq page
        get "faq.html" => "faq#index", as: :faq

        # video background page
        get "video-bg.html" => "video_bg#index", as: :video_bg
        
        # coming soon page
        get "coming-soon.html" => "coming_soon#index", as: :coming_soon

        # history  timeline page
        get "history.html" => "history#index", as: :history

        # login page
        get "login.html" => "login#index", as: :login

        # register page
        get "register.html" => "register#index", as: :register

        # error page
        get "error-page.html" => "error_page#index", as: :error_page
    
    # END PAGES
    
    # blog pages
    get "blog-1.html" => "blog1#index", as: :blog1
    get "blog-2.html" => "blog2#index", as: :blog2
    get "news.html" => "blog3#index", as: :blog3
    get "news/:news_id.html" => "blog3#blog_post", as: :blog_post
    
    # support page
    get "support.html" => "support#index", as: :support
    
    # contact pages
    get "contact.html" => "contact#index", as: :contact
    get "contact/message-sent-success.html" => "contact#message_sent_success", as: :message_sent_success
    get "contact-2.html" => "contact2#index", as: :contact2
    get "contact-3.html" => "contact3#index", as: :contact3
    
    # portfolio page
    get "works.html" => "works#index", as: :works
    get "works/:project_id.html" => "works#detail", as: :work_detail
    
    resources :contacts
    resources :newsletters
    get "email-signup-success.html" => "email_signup_success#index", as: :email_signup_success
    
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
        
        # projects
        resources :projects
        resources :project_categories
        resources :program_languages
      end
    end
  end
end
