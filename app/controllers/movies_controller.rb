# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit destroy update]
  before_action :authenticate_user!, except: [:show]
  before_action :set_user

  # GET /movies or /movies.json
  def index; end

  # GET /movies/1 or /movies/1.json
  def show; end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit; end

  # POST /movies or /movies.json
  def create
    api_response = OmdbApiClient.fetch_movie_by_form_inputs(title: movie_params[:Title])

    if api_response['Response'] == 'False'
      redirect_to new_user_movie_path(current_user), alert: api_response['Error']
    else
      @movie = current_user.movies.build(movie_params(api_response))

      if @movie.save
        redirect_to [@movie.user, @movie]
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to user_movie_url(@movie.user, @movie) }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to user_movies_url(@movie.user), notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'User not found.'
    redirect_to root_path
  end

  # Only allow a list of trusted parameters through.
  def movie_params(api_response = nil)
    if api_response
      api_response.slice(*permitted_attributes).merge(user_id: current_user.id)
    else
      params.require(:movie)
            .permit(
              :user_id,
              :Title,
              :Year,
              :Rated,
              :Released,
              :Runtime,
              :Genre,
              :Director,
              :Writer,
              :Actors,
              :Plot,
              :Language,
              :Country,
              :Awards,
              :Poster,
              :Metascore,
              :imdbRating,
              :imdbVotes,
              :imdbID,
              :Type,
              :DVD,
              :BoxOffice,
              :Production,
              :Website
            )
    end
  end

  def permitted_attributes
    %w[Title Year Rated Released Runtime Genre Director Writer
       Actors Plot Language Country Awards Poster Metascore
       imdbRating imdbVotes imdbID Type DVD BoxOffice Production Website]
  end
end
