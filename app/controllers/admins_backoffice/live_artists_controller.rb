class AdminsBackoffice::LiveArtistsController < AdminsBackofficeController

  before_action :set_artist, only: [:edit, :update, :destroy, :create]
  before_action :get_genres, only: [:new, :edit, :create, :update]
  before_action :get_artists, only: [:new, :edit, :create, :update]

  def index
    @live_artists = ArtistLive.includes(:genre, :artist).page(params[:page])

  end

  def new
    @live_artist = ArtistLive.new
  end

  def create
    @live_artist = ArtistLive.new(params_live_artist)
    if @live_artist.save
      redirect_to admins_backoffice_artists_path, notice: "Artista criado com sucesso!"
    else
      render :new
    end
  end
    
  def edit
  end

  def update
    if @live_artist.update(params_live_artist)
      redirect_to admins_backoffice_artists_path, notice: "Artista atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @live_artist.destroy
      redirect_to admins_backoffice_artists_path, notice: "Artista excluido com sucesso!"
    else
      render :index
    end

    
  end
  


  private 
  
  def params_live_artist
    params.require(:live_artist).permit(:artist_id, :livestream_id)
  end

  def set_live_artist
    @artist = ArtistLive.find(params[:id])    
  end

  def get_genres
    @genres = Genre.all.order(:description)
  end

  def get_artists
    @artists = Artist.all.order(:name)
  end

end