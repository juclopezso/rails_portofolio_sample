class PortofoliosController < ApplicationController
    before_action :set_portofolio_item, only: [:edit, :update, :show, :destroy]
   layout "portofolio"
   access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

    #/portotofolios - list of all portofolios
    def index
        @portofolio_items = Portofolio.all
        #CUSTOM SCOPES
        #@portofolio_items = Portofolio.ruby_portofolio_items
        #@portofolio_items = Portofolio.angular
        
        #Not very good
        #@portofolio_items = Portofolio.where(subtitle: 'Angular')
    end

    #CUSTOM SCOPE
    def angular
        @angular_portofolio_items = Portofolio.angular
    end

    def show
        # binding.pry
    end

    def new
        #.new only render the item, doesn't creates it
        @portofolio_item = Portofolio.new
        # .build instantiates the objects
        3.times { @portofolio_item.technologies.build }
    end

    def edit
        3.times { @portofolio_item.technologies.build }
    end

    def destroy
        @portofolio_item.destroy
        
        respond_to do |format|
            format.html {redirect_to portofolios_path, notice: "Portofolio was deleted."}
        end
    end

    def create
        @portofolio_item = Portofolio.new(portofolio_params)

        respond_to do |format|
            if @portofolio_item.save
                format.html { redirect_to portofolios_path, notice: 'Portofolio saved.' }
            else
                format.html {render :new}     
            end
        end
    end

    # PATCH/PUT /blogs/1.json
    def update
        # portofolios_path : path to portofolios 
        # portofolios_url  : real path in the system 
        respond_to do |format|
            if @portofolio_item.update(portofolio_params)
                format.html { redirect_to portofolios_path, notice: 'Blog was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

    private

    def portofolio_params
        params.require(:portofolio).permit(
            :title, 
            :subtitle, 
            :body,
            technologies_attributes: [:name])
    end

    def set_portofolio_item
        @portofolio_item = Portofolio.find(params[:id])
    end

end
