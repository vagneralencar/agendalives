class AdminsBackoffice::ArtistLivesController < AdminsBackofficeController
  
    before_action :set_artist, only: [:edit, :update, :destroy]
    before_action :get_genres, only: [:new, :edit]

    def index
      @artists_lives = ArtistLive.includes(:genre).page(params[:page])
    end
  
    def new
      @artist_live = ArtistLive.new
    end
  
    def create
      @artist_live = ArtistLive.new(params_artist_live)
      if @artist_live.save
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

    def get_genres
      @genres = Genre.all.order(:description)
    end
  end
