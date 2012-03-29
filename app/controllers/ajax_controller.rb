class AjaxController < ApplicationController
  layout false
  
  def save_reminder
    rem = Reminder.find(params[:id])
    
    rem.content = params[:content]
    
    date_arr = params[:date].split('.')
    time = "#{params[:time]}:00"
    
    due_to = "#{date_arr[2]}-#{date_arr[1]}-#{date_arr[0]} #{time}"
    
    rem.due_to = due_to
    
    if rem.save
      render :text => "ok;Muutokset tallennettu"
    else
      render :text => "error;Jotain meni pieleen, tarkista tiedot."
    end
  end
  
  def delete_reminder
    if Reminder.find(params[:id]).delete
      render :text => "ok;Muistutus poistettu"
    else
      render :text => "error;Jotain meni pieleen"
    end
    
  end

  def create_new
    if params[:content] == ""
      render :text => "error;Et voi luoda tyhjaa muistutusta"
      return
    end
    
    due_to = ""
    
    #Following block assings value to due_to, so that if the parameter values are given, the
    # due_to will be set to defaults, which are a week from today and 12 'o clock
    if (params[:date] == "") & (params[:time] == "")
      due_to = "#{(Time.now+604800).strftime("%y-%m-%d")} 12:00:00"
    else
      if (params[:date] == "") & (!params[:time] == "")
        due_to = "#{(Time.now+604800).strftime("%y-%m-%d")} #{params[:time]}:00"
      else
        if (!params[:date] == "") & (params[:time] == "")
          date_arr = params[:date].split('.')
          
          due_to = "#{date_arr[2]}-#{date_arr[1]}-#{date_arr[0]} 12:00:00"
        else
          date_arr = params[:date].split('.')
          time = "#{params[:time]}:00"
    
          due_to = "#{date_arr[2]}-#{date_arr[1]}-#{date_arr[0]} #{time}"
        end
      end
    end
    
    rem = Reminder.new(content: params[:content], due_to: due_to)
    
    if rem.save
      render :text => "ok;Uusi muistutus luotu"
    else
      render :text => "error;Jotain meni pieleen, tarkista tiedot."
    end  
  end
  
  def update_table
    
  end
  
end
