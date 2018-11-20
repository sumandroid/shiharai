class TransactionsDatatable
  delegate :params, :h, :link_to, to: :@view

  require 'will_paginate/array'

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Transaction.count,
      iTotalDisplayRecords: transactions.total_entries,
      aaData: data
    }
  end

private

  def data
    transactions.map do |transaction|
      order = transaction.order
      [
        order.id.to_s,
        order.order_line_items.first.title,
        transaction.email,
        transaction.phone,
        transaction.amount,
        transaction.txn_status,
        transaction.mode,
        transaction.txn_id,
        transaction.created_at.strftime("%B %e, %Y")
      ]
    end
  end

  def transactions
    @transactions ||= fetch_transactions
  end

  def fetch_transactions
    transactions = Transaction.includes(:order).desc(:created_at)
    transactions = transactions.paginate(page: page, per_page: per_page)
    transactions
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end