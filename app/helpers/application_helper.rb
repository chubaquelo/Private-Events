module ApplicationHelper
  def all_my_events(event)
    if event.empty?
      concat content_tag(:p, "You didn't create any event yet. ", class: 'text-danger ml-5 mr-2')
      concat content_tag(:a, link_to('Create a new event now.', new_event_path))
    else
      event.each do |ev|
        concat my_events(ev)
      end
    end
  end

  def my_future_events(event)
    if event.empty?
      concat content_tag(:p, "You won't assist to any event yet.", class: 'text-danger ml-5 mr-2')
      concat content_tag(:a, link_to('Check the events list here.', event_index_path))
    else
      event.each do |ev|
        concat my_events(ev) if ev.datetime > Time.zone.now
      end
    end
  end

  def my_past_events(event)
    if event.empty?
      concat content_tag(:p, "You didn't assisted to any event yet.", class: 'text-danger ml-5')
    else
      event.each do |ev|
        concat my_events(ev) if ev.datetime < Time.zone.now
      end
    end
  end

  def show_attendees(users)
    if users.empty?
      concat content_tag(:p, 'There are no confirmed attendees yet.', class: 'text-danger mt-4')
    else
      users.each do |user|
        concat content_tag(:li, user.name, class: 'list-group-item font-weight-bold font-italic')
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
      concat content_tag(:li, "Location: #{event.location}", style: 'list-style: none;')
      concat content_tag(:li, "Date: #{event.datetime.strftime('On %m/%d/%Y, at %I:%M%p')}", style: 'list-style: none;')
      concat content_tag(:p, "#{event.attendees.count} attendees", class: 'small text-muted')
      concat content_tag(:a, link_to('View Attendees', event_path(event.id), class: 'badge badge-primary')) +
             (unless check_assistance(current_user[:id], event)
                (link_to 'Assist', attendee_index_path(attendee: { user_id: current_user.id, event_id: event.id }),
                         method: :post, class: 'badge badge-success ml-2')
              end) +
             (if check_assistance(current_user[:id], event)
                (link_to 'Unassist', attendee_path(id: event,
                                                   attendee: { user_id: current_user.id, event_id: event.id }),
                         method: :delete, class: 'badge badge-warning ml-2')
              end)
      concat content_tag(:span, '  ')
      if event.author == current_user && !current_user.nil?
        concat content_tag(:a, link_to('Delete', event_path(event.id), method: :delete,
                                                                       data: { confirm: 'Are you sure?' },
                                                                       class: 'badge badge-danger'))
      end
      # if signed_in? && check_assistance(current_user[:id], event)
      #   concat content_tag(:span, '  ')
      #   concat render 'unassist_btn'
      # elsif signed_in? && !check_assistance(current_user[:id], event)
      #   concat content_tag(:span, '  ')
      #   concat render 'assist_btn'
      # end
      concat content_tag(:hr)
    end
  end

  def my_events(event)
    content_tag(:div, content_tag(:div, nested_div(event), class: 'card w-100 mb-3'),
                class: 'col-sm-3 d-flex align-items-stretch')
  end

  def nested_div(event)
    content_tag(:div, content_for_nested(event),
                class: 'card-body')
  end

  def content_for_nested(event)
    content_tag(:h4, "<span class='small'>Location:</span> #{event.location}".html_safe, class: 'card-title') +
      content_tag(:p, event.datetime.strftime('On %m/%d/%Y, at %I:%M%p'), class: 'card-title') +
      content_tag(:p, "#{event.attendees.count} attendees", class: 'small text-muted') +
      (link_to 'View event', event_path(event.id), class: 'badge badge-primary') + '  ' +
      (if current_user == event.author
         (link_to 'Delete Event', event_path(event.id), method: :delete, class: 'badge badge-warning',
                                                        data: { confirm: 'Are you sure?' })
       end) + '  ' +
      (unless check_assistance(current_user[:id], event)
         (link_to 'Assist', attendee_index_path(attendee: { user_id: current_user.id, event_id: event.id }),
                  method: :post, class: 'badge badge-success')
       end) +
      (if check_assistance(current_user[:id], event)
         (link_to 'Unassist', attendee_path(attendee: { user_id: current_user.id, event_id: event.id }),
                  method: :delete, class: 'badge badge-danger')
       end)
  end
end
