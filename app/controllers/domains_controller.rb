class DomainsController < ApplicationController
    def index
        @domain_name = Article.lookup_domain(params[:enter_domain_name])
    end
end
