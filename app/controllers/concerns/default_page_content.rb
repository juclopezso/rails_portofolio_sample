module DefaultPageContent
    extend ActiveSupport::Concern

    included do 
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = "Juancho Portofolio Website"
        @seo_keywords = "Juan Camilo Lopez"
    end
end