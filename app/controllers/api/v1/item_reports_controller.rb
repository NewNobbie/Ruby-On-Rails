class Api::V1::ItemReportsController < ApplicationController
before_action :set_item_report, only: [:show, :update, :destroy]

  def index
    @item_reports = ItemReport.all
    render json: @item_reports
  end

  def show
    render json: @item_report
  end  

  def create
    @item_report = ItemReport.new(item_params)

    if @item_report.save
      begin
        ItemReportMailer.new_report_email(@item_report).deliver_now  
        render json: @item_report, status: :created
      rescue StandardError => e
        @item_report.destroy #If the email fails...
        render json: { error: "Item report could not be created. Mail sending failed: #{e.message} "}, status: :unprocessable_entity
      end
    else 
      render json: @item_report.errors, status: :unprocessable_entity
    end  
  end  

  def update
    if @item_report.update(item_params_to_update)
      render json: @item_report
    else
      render json: @item_report.errors, status: :unprocessable_entity  
    end  
  end

  def destroy
    @item_report.destroy
    head :no_content
  end

  private

  def set_item_report
    @item_report = ItemReport.find(params[:id])    
  end

  def item_params
    params.require(:item_report).permit(:item_name, :report_count,:last_reported_at,:status)
  end  

  def item_params_to_update
    params.require(:item_report).permit(:status)
  end  
end
