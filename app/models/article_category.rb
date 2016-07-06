class ArticleCategory < ActiveRecord::Base
  validates :name, presence: true
  
  has_and_belongs_to_many :articles
  has_many :parent_article_categories, dependent: :destroy
  has_many :parent, through: :parent_article_categories, source: :parent
  has_many :child_article_categories, class_name: "ParentArticleCategory", foreign_key: "parent_id", dependent: :destroy
  has_many :children, through: :child_article_categories, source: :article_category
  
  def update_level(lvl)
    self.level = lvl
    self.save
  end
  
  # New discovery
  def self.get_menu_events
    self.all.where(description: "event").order("created_at ASC")
  end
  def self.get_menu_tour_handbooks
    self.all.where(description: "tour_handbook").order("created_at ASC")
  end
  def self.get_menu_tours
    self.all.where(description: "tour").order("created_at ASC")
  end
  def self.get_menu_about_us
    self.all.where(description: "about_us").first
  end
  def self.get_menu_car_hires
    self.all.where(description: "car_hire").order("created_at ASC")
  end
  def self.get_menu_travel_news
    self.all.where(description: "travel_news").first
  end
  def self.get_menu_services
    self.all.where(description: "services").order("created_at ASC")
  end
  
  def get_blogs_for_categories(params)
    records = Article.get_active_articles
    if params[:tour_handbook_sub_1].present?
      article_category = ArticleCategory.find(params[:tour_handbook_sub_1])
    end
    if params[:tour_handbook_sub_2].present?
      article_category = ArticleCategory.find(params[:tour_handbook_sub_2])
    end
    if params[:event_id].present?
      article_category = ArticleCategory.find(params[:event_id])
    end
    records = records.joins(:article_categories).where(article_categories: {id: article_category.get_all_related_ids}).uniq
    
    return records
  end
  
  def self.get_tour_handbook_blogs
    records = Article.get_active_articles
    records = records.joins(:article_categories).where(article_categories: {id: self.where(description: "tour_handbook").first.get_all_related_ids}).uniq
    
    return records
  end
  
  def self.get_tour_blogs
    records = Article.get_active_articles
    records = records.joins(:article_categories).where(article_categories: {id: self.where(description: "tour").first.get_all_related_ids}).uniq
    
    return records
  end
  
  def self.get_event_blogs
    records = Article.get_active_articles
    records = records.joins(:article_categories).where(article_categories: {id: self.where(description: "event").first.get_all_related_ids}).uniq
    
    return records
  end
  
  def self.get_travel_news
    records = Article.get_active_articles
    records = records.joins(:article_categories).where(article_categories: {id: self.where(description: "travel_news").first.get_all_related_ids}).uniq
    
    return records
  end
  
  def get_all_related_ids
      arr = []
      arr << self.id
      self.children.each do |i1|
          arr << i1.id
          i1.children.each do |i2|
              arr << i2.id
              i2.children.each do |i3|
                  arr << i3.id
              end
          end 
      end
      
      return arr
  end
  
  def self.sort_by
    [
      [I18n.t('created_at'),"created_at"]
    ]
  end
  
  def self.sort_order
    [
      [I18n.t('asc'),"asc"],
      [I18n.t('desc'),"desc"],
    ]
  end
  
  #Filter, Sort
  def self.search(params)
    records = self.all

    #Search keyword filter
    if params[:keyword].present?
      records = records.where("LOWER(CONCAT(article_categories.name,' ',article_categories.description)) LIKE ?", "%#{params[:keyword].downcase.strip}%")
    end
    
    # for sorting
    sort_by = params[:sort_by].present? ? params[:sort_by] : "article_categories.created_at"
    sort_order = params[:sort_order].present? ? params[:sort_order] : "asc"
    records = records.order("#{sort_by} #{sort_order}")
    
    return records   
  end
  
end
