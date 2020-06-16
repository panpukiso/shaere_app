class PdfsController < ApplicationController
  def index
    @pdfs = Pdf.all
  end

  def new
    @pdf = Pdf.new
  end
  
  def create
    @pdf = current_user.pdfs.new(pdf_params)
    
    if @pdf.save
      flash.now[:success] = '過去問を投稿しました。'
      redirect_to pdfs_url
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @pdf = Pdf.find(params[:id])
    @pdf.destroy
    flash[:success] = "過去問を削除しました。"
    redirect_to pdfs_path
  end
  
  private
    def pdf_params
      params.require(:pdf).permit(:user_id, :title, :description, :file)
    end
end
