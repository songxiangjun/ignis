class HistoryController < LoggedInController

  def show
    return head :bad_request unless params.has_key? :rooms and params[:rooms].instance_of? Array and not params[:rooms][0].empty? # Sanity check
    
    rooms       = params[:rooms]
    starttime   = (params.has_key? :start  and not params[:start].empty?)  ? params[:start].to_date  : nil
    endtime     = (params.has_key? :end    and not params[:end].empty?)    ? params[:end].to_date    : nil
    searchterms = (params.has_key? :search and not params[:search].empty?) ? params[:search]         : nil
    
    messages = Message
    
    messages = messages.where_in_rooms(rooms)
    messages = messages.limit_recent.reverse                    if starttime == nil and endtime == nil and searchterms == nil
    messages = messages.where_for_timerange(starttime, endtime) unless starttime   == nil and endtime == nil
    messages = messages.where_for_search(searchterms)           unless searchterms == nil
    
    templateVariables = { :fromdate => starttime, :todate => endtime, :terms => searchterms, :messages => messages }
    respond_to do | format |
      format.html { render :partial => "home/history", :locals => templateVariables }
      format.json { render :json => {:history => render_to_string(:partial => "home/history.html", :locals => templateVariables), :time => Time.now, :room => rooms} }
    end
  end

end
