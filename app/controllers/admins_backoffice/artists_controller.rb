class AdminsBackoffice::ArtistsController < AdminsBackofficeController
  
    before_action :set_artist, only: [:edit, :update, :destroy]
    def index
      @artists = Artist.all.page(params[:page])
    end
  
    def new
      @artist = Artist.new
    end
  
    def create
      @artist = Artist.new(params_artist)
      if @artist.save
        redirect_to admins_backoffice_artists_path, notice: "Artista criado com sucesso!"
      else
        render :new
      end
    end
      
    def edit
    end
  
    def update
      if @artist.update(params_artist)
        redirect_to admins_backoffice_artists_path, notice: "Artista atualizado com sucesso!"
      else
        render :edit
      end
    end
  
    def destroy
      if @artist.destroy
        redirect_to admins_backoffice_artists_path, notice: "Artista excluido com sucesso!"
      else
        render :index
      end
  
      
    end
    
  
  
    private 
    
    def params_artist
      params.require(:artist).permit(:name, :image, :facebook, :instagram, :youtube, :genre_id)
    end
  
    def set_artist
      @artist = Artist.find(params[:id])    
    end

  end