class AuthorPostsController < ApplicationController
  before_action :set_author_post, only: %i[ show edit update destroy ]

  # GET /author_posts or /author_posts.json
  def index
    @author_posts = AuthorPost.all
    if params[:author_id]
      @author = Author.find(params[:author_id])
      @author_posts = @author.author_posts
    end
  end

  # GET /author_posts/1 or /author_posts/1.json
  def show
  end

  # GET /author_posts/new
  def new
    @author_post = AuthorPost.new
  end

  # GET /author_posts/1/edit
  def edit
  end

  # POST /author_posts or /author_posts.json
  def create
    @author_post = AuthorPost.new(author_post_params)

    respond_to do |format|
      if @author_post.save
        format.html { redirect_to author_post_url(@author_post), notice: "Author post was successfully created." }
        format.json { render :show, status: :created, location: @author_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_posts/1 or /author_posts/1.json
  def update
    respond_to do |format|
      if @author_post.update(author_post_params)
        format.html { redirect_to author_post_url(@author_post), notice: "Author post was successfully updated." }
        format.json { render :show, status: :ok, location: @author_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /author_posts/1 or /author_posts/1.json
  def destroy
    @author_post.destroy!

    respond_to do |format|
      format.html { redirect_to author_posts_url, notice: "Author post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_post
      @author_post = AuthorPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_post_params
      params.require(:author_post).permit(:author_id, :title)
    end
end
