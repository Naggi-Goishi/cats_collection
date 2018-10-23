class CatsController < ApplicationController

  # GET '/'
  def index
    # データベース（モデルを通じて）猫のレコードを全て取ってくる
    @cats = Cat.all
  end

  # GET '/cats/new'
  def new
    # モデルを通じて新規レコードを作成する
    @cat = Cat.new
  end

  # POST '/cats'
  def create
    # モデルを通じて新規レコードをparamsを使用してデータと一緒に作成する
    @cat = Cat.new(cat_params)

    # 作成した新規レコードを保存する
    if @cat.save
      # 保存が成功した場合はトップページに戻る
      redirect_to root_url, notice: '猫の保存に成功しました'
    else
      # 保存が失敗した場合はnewのフォームに戻る
      render :new
    end
  end

  # GET '/cats/:id'
  def show
    @cat = Cat.find(params[:id])
  end

  # GET '/cats/:id/edit'
  def edit
    @cat = Cat.find(params[:id])
  end

  # PUT/PATCH '/cats/:id'
  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cat_params)
      redirect_to root_url, notice: '猫の編集に成功しました'
    else
      render :edit
    end
  end

  # DELETE '/cats/:id'
  def destroy
    @cat = Cat.find(params[:id])

    if @cat.delete
      redirect_to root_url, notice: '猫の削除に成功しました'
    else
      render :show
    end
  end

  private
  # 送られてきたデータから必要なものだけを厳選する
  def cat_params
    params.require(:cat).permit(:name, :url, :age, :text)
  end
end
