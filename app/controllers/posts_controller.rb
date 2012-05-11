# coding: utf-8
class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:update,:create,:destroy,:edit,:show]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.find(:all, :order => "updated_at")
    @posts.reverse!

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.created_at = DateTime.now
    @post.body.html_safe
    flash[:notice] =  "บันทึกหัวข้อ #{@post.title}  เรียบร้อย"
    if @post.save
    redirect_to show_url(@post.id,@post.title) #:action => 'show', :id => @post.id, :title => @post.title
    end
   
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.updated_at = DateTime.now
    flash[:notice] =  "อัพเดทหัวข้อ #{@post.title} เรียบร้อย"
      if @post.update_attributes(params[:post])
        redirect_to show_url(@post.id,@post.title)
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] =  "ลบ #{@post.title} สำเร็จ"

      redirect_to root_url 
  end
end
