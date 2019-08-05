class Portofolio < ApplicationRecord
    #one to many relation
    has_many :technologies

    #nested attributes for technologies
    accepts_nested_attributes_for :technologies, 
        reject_if: lambda { |attrs| attrs['name'].blank? }
    
    #For add from console
    #Portofolio.create!(title: "Web app", subtitle: "Best of the best", body: "sacsdvcs vdfv dfv dfvdfv fdv", 
    #    technologies_attributes: [{name: "Ruby"},{name: "Rails"}, {name: "Angular"}])
    
    include Placeholder #concern (Function that can be used on all models)

    validates_presence_of :title, :body, :main_image, :thumb_image

    #CUSTOM SCOPES
    def self.angular
        where(subtitle: 'Angular')
    end
    #Both do the same 
    scope :ruby_portofolio_items, -> { where(subtitle: 'Rubt on Rails') }
    ############

    #Run the set_deafults after initialize the model
    after_initialize :set_defaults

    def set_defaults # ||= -> prevents override
        self.main_image ||= Placeholder.image_generator(600,400)
        self.thumb_image ||= Placeholder.image_generator(350,200)
    end
end

########## ||= EXPLANATION #########
# if self.main_image == nil
#     self.main_image ||= "https://via.placeholder.com/600x400"     
# end