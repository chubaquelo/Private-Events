module ApplicationHelper
  
  def something(events)
    events.each do |event|
      concat content_tag(:div, content_tag(:div, content_tag(:div, content_tag(:h4, event.location, class: "card-title") + content_tag(:p, event.datetime, class: "card-title") + (link_to 'View event', event_path(event.id)), class: 'card-body'), class: 'card w-100 mb-3'), class: 'col-sm-3 d-flex align-items-stretch')
    end
  end

  def next_something(event)
    event.each do |event|
      if event.datetime > Time.zone.now
        concat content_tag(:div, content_tag(:div, content_tag(:div, content_tag(:h4, event.location, class: "card-title") + content_tag(:p, event.datetime, class: "card-title") + (link_to 'View event', event_path(event.id)), class: 'card-body'), class: 'card w-100 mb-3'), class: 'col-sm-3 d-flex align-items-stretch')
      end
    end
  end

  def nex2(event)
    event.each do |event|
      if event.datetime < Time.zone.now
        concat content_tag(:div, content_tag(:div, content_tag(:div, content_tag(:h4, event.location, class: "card-title") + content_tag(:p, event.datetime, class: "card-title") + (link_to 'View event', event_path(event.id)), class: 'card-body'), class: 'card w-100 mb-3'), class: 'col-sm-3 d-flex align-items-stretch')
      end
    end  
  end

  def show_attendees(users)
    if users.empty?
      concat content_tag(:p, 'There are no confirmed attendees yet.', class: 'text-danger')
    else
      users.each do |user|
        concat content_tag(:li, user.name, class: 'list-style: none;' )
      end
    end
  end

  def assistance_btn(event)
    if signed_in? && !check_assistance(current_user[:id], event)
      concat render 'assist_btn'
    elsif signed_in? && check_assistance(current_user[:id], event)
      concat render 'unassist_btn'
    end
  end

  def list_events(events)
    events.each do |event|
      concat content_tag(:li, "Location: " + event.location + " | " + "Date: " + event.datetime.to_s, style: "list-style: none;")
      concat content_tag(:a, link_to('View Event', event_path(event.id)))
      concat content_tag(:hr)
    end
  end
end
