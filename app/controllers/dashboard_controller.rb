class DashboardController < ApplicationController
  def index
    @sales_grouped_by_month = Sale.group_by_month(:date_time, range: 1.year.ago..Time.now).order(date_time: :asc).sum(:price)
    @sales_counted_by_month = Sale.group_by_month(:date_time, range: 1.year.ago..Time.now).order(date_time: :asc).count(:price)
    @sales_prom_by_month = (Sale.group_by_month(:date_time, range: 1.year.ago..Time.now).order(date_time: :asc).average(:price))
    
    @sales_origin_12_months = Sale.group(:origin).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 12.months, Date.today.beginning_of_month).count
    @sales_origin_6_months = Sale.group(:origin).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 6.months, Date.today.beginning_of_month).count
    @sales_origin_3_months = Sale.group(:origin).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 3.months, Date.today.beginning_of_month).count
    @sales_origin_last_month = Sale.group(:origin).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 1.months, Date.today.beginning_of_month).count

    @sales_blend_12_months =Sale.group(:blend).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 12.months, Date.today.beginning_of_month).count
    @sales_blend_6_months =Sale.group(:blend).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 6.months, Date.today.beginning_of_month).count
    @sales_blend_3_months =Sale.group(:blend).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 3.months, Date.today.beginning_of_month).count
    @sales_blend_last_month =Sale.group(:blend).where('date_time > ? and date_time < ?', Date.today.beginning_of_month - 1.months, Date.today.beginning_of_month).count

  end
end
