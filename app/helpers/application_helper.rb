module ApplicationHelper
  
  def something(events)
    events.each do |event|
      concat content_tag(:div, content_tag(:div,  content_tag(:div, content_tag(:h4, event.location, class: "card-title") + content_tag(:p, event.datetime, class: "card-title") + (link_to 'View event', event_path(event.id)), class: 'card-body'), class: 'card w-100 mb-3'), class: 'col-sm-3 d-flex align-items-stretch')
    end
  end

  def next_something(event)
    event.each do |event|
      if event.datetime > Time.zone.now
        concat content_tag(:div, content_tag(:div,  content_tag(:div, content_tag(:h4, event.location, class: "card-title") + content_tag(:p, event.datetime, class: "card-title") + (link_to 'View event', event_path(event.id)), class: 'card-body'), class: 'card w-100 mb-3'), class: 'col-sm-3 d-flex align-items-stretch')
      end
    end
  end


  def nex2(event)
    event.each do |event|
      if event.datetime < Time.zone.now
        concat content_tag(:div, content_tag(:div,  content_tag(:div, content_tag(:h4, event.location, class: "card-title") + content_tag(:p, event.datetime, class: "card-title") + (link_to 'View event', event_path(event.id)), class: 'card-body'), class: 'card w-100 mb-3'), class: 'col-sm-3 d-flex align-items-stretch')
      end
    end  
  end

end
