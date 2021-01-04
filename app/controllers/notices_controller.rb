class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :set_pdf_notice, only: [:show_pdf]
  before_action :authenticate_user!
  before_action :check_notice_user, only: [:show, :edit, :update, :destroy]

  # GET /notices
  # GET /notices.json
  def index
    @notices = current_user.notices.page params[:page]
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  def show_pdf
    report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/kairanban_default.tlf")

    report.start_new_page
    # 以下で各カラムごとのデータを入れる
    report.page.item(:title).value(@notice.title)
    report.page.item(:to).value(@notice.to)
    report.page.item(:from).value(@notice.from)
    report.page.item(:auther).value(@notice.auther)
    report.page.item(:greet).value(@notice.greet)
    report.page.item(:content).value(@notice.content)

    file = report.generate
    send_data(
      file,
      filename: "#{@notice.title}.pdf",
      type: 'application/pdf',
      disposition: 'inline'
    )
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)
    @notice.user_id = current_user.id

    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, notice: 'Notice was successfully created.' }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to @notice, notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    def set_pdf_notice
      @notice = Notice.find(params[:notice_id])
    end

    def check_notice_user
      if @notice.user_id != current_user.id
        redirect_to notices_url, notice: 'そのお知らせにはアクセスできません'
      end
    end

    # Only allow a list of trusted parameters through.
    def notice_params
      params.require(:notice).permit(:title, :to, :from, :auther, :greet, :content)
    end
end
