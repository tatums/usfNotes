class EventsController < ApplicationController

  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  def new
    @note = Note.find(params[:note_id])    
    @event = @note.events.build(params[:event])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  def edit
    @event = Event.find(params[:id])
  end



  def create
    @note = Note.find(params[:note_id])    
    @event = @note.events.build(params[:event])
    @event.end_at = @event.start_at
    @event.name = @note.title
    respond_to do |format|
      if @event.save
        format.html { redirect_to(@note, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @note, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(@event.note) }
      format.xml  { head :ok }
    end
  end
end
