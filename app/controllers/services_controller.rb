class ServicesController < ApplicationController
    def index
        @program_languages = ProgramLanguage.all
    end
    
    def services_sub_1
        @program_languages = ProgramLanguage.all
        @web_design_and_development = Article.get_web_design_and_development
    end
    
    def services_sub_2
        @program_languages = ProgramLanguage.all
        @web_based_software_development = Article.get_web_based_software_development
    end
    
    def services_sub_4
        @program_languages = ProgramLanguage.all
        @google_apps_for_bussiness = Article.get_google_apps_for_bussiness
    end
    
    def services_sub_5
        @program_languages = ProgramLanguage.all
        @outsourcing = Article.get_outsourcing
    end
    
    def services_sub_6
        @program_languages = ProgramLanguage.all
        @research_and_development = Article.get_research_and_development
    end
    
    def services_sub_7
        @program_languages = ProgramLanguage.all
        @systems_integration = Article.get_systems_integration
    end
    
    def services_sub_8
        @program_languages = ProgramLanguage.all
        @email_marketing = Article.get_email_marketing
    end
    #............................................
    def services_sub_1_1
        @program_languages = ProgramLanguage.all
        @content_management_system = Article.get_content_management_system
    end
    
    def services_sub_1_2
        @program_languages = ProgramLanguage.all
        @b2b_trade_portal = Article.get_b2b_trade_portal
    end
    
    def services_sub_1_3
        @program_languages = ProgramLanguage.all
        @b2c_e_commerce_site = Article.get_b2c_e_commerce_site
    end
    
    def services_sub_1_4
        @program_languages = ProgramLanguage.all
        @real_estate_site = Article.get_real_estate_site
    end
    
    def services_sub_1_5
        @program_languages = ProgramLanguage.all
        @travel_and_tourism_site = Article.get_travel_and_tourism_site
    end
    
    def services_sub_2_1
        @program_languages = ProgramLanguage.all
        @erp_system = Article.get_erp_system
    end
    
    def services_sub_2_2
        @program_languages = ProgramLanguage.all
        @education_and_school_system = Article.get_education_and_school_system
    end
    
    def services_sub_2_3
        @program_languages = ProgramLanguage.all
        @real_estale_agent_monitor = Article.get_real_estale_agent_monitor
    end
end
