class AdminsBackoffice::LivestreamsController < AdminsBackofficeController

  before_action :set_livestream, only: [:edit, :update, :destroy]
    before_action :get_genres, only: [:new, :edit]

    def index
      @livestreams = Livestream.includes(:genre).page(params[:page])
    end
  
    def new
      @livestream = Livestream.new
      @genres = Genre.all.order(:description)
    end
  
    def create
      @livestream = Livestream.new(params_livestream)
      if @livestream.save
        redirect_to admins_backoffice_livestreams_path, notice: "Live criado com sucesso!"
      else
        render :new
      end
    end
      
    def edit
    end
  
    def update
      if @livestream.update(params_livestream)
        redirect_to admins_backoffice_livestreams_path, notice: "Live atualizado com sucesso!"
      else
        render :edit
      end
    end
  
    def destroy
      if @livestream.destroy
        redirect_to admins_backoffice_livestreams_path, notice: "Live excluido com sucesso!"
      else
        render :index
      end
  
      
    end
 
  
    def get_artist
      @artists = Artist.all.order(:name)
    end
    
    private 
    
    def params_livestream
      params.require(:livestream).permit(:description, :data, :hora, :image, :youtube, :instagram, :facebook, :genre_id,
                                  artist_lives_attributes: [:id, :livestream_id, :artist_id, :_destroy ])
    end
  
    def set_livestream
      @livestream = Livestream.find(params[:id])    
    end

    def get_genres
      @genres = Genre.all.order(:description)
    end
    
end
