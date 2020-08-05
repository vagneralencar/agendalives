class AdminsBackoffice::LivesController < AdminsBackofficeController
  
    before_action :set_live, only: [:edit, :update, :destroy]
    before_action :get_genres, only: [:new, :edit]

    def index
      @lives = Live.includes(:genre).page(params[:page])
    end
  
    def new
      @live = Live.new
    end
  
    def create
      @live = Live.new(params_live)
      if @live.save
        redirect_to admins_backoffice_lives_path, notice: "Live criado com sucesso!"
      else
        render :new
      end
    end
      
    def edit
    end
  
    def update
      if @live.update(params_live)
        redirect_to admins_backoffice_lives_path, notice: "Live atualizado com sucesso!"
      else
        render :edit
      end
    end
  
    def destroy
      if @live.destroy
        redirect_to admins_backoffice_lives_path, notice: "Live excluido com sucesso!"
      else
        render :index
      end
  
      
    end
 
  
    def get_artist
      @artists = Artist.all.order(:name)
    end
    
    private 
    
    def params_live
      params.require(:live).permit(:description, :data, :hora, :image, :youtube, :instagram, :facebook, :genre_id,
                                  artist_lives_atributes: [:id, :live, :artist, :_destroy ])
    end
  
    def set_live
      @live = Live.find(params[:id])    
    end

    def get_genres
      @genres = Genre.all.order(:description)
    end

  end