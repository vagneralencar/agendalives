class AdminsBackoffice::GenresController < AdminsBackofficeController
  
    before_action :set_genre, only: [:edit, :update, :destroy]
    def index
      @genres = Genre.all.page(params[:page])
    end
  
    def new
      @genre = Genre.new
    end
  
    def create
      @genre = Genre.new(params_genre)
      if @genre.save
        redirect_to admins_backoffice_genres_path, notice: "Genero atualizado com sucesso!"
      else
        render :new
      end
    end
      
    def edit
    end
  
    def update
      if @genre.update(params_genre)
        redirect_to admins_backoffice_genres_path, notice: "Genero atualizado com sucesso!"
      else
        render :edit
      end
    end
  
    def destroy
      if @genre.destroy
        redirect_to admins_backoffice_genres_path, notice: "Genero excluido com sucesso!"
      else
        render :index
      end
  
      
    end
    
  
  
    private 
    
    def params_genre
      params.require(:genre).permit(:description)
    end
  
    def set_genre
      @genre = Genre.find(params[:id])    
    end

  end
  