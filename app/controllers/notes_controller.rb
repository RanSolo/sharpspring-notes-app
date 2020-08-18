# frozen_string_literal: true

# notes controller
class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy note_email]
  before_action :set_user, only: %i[index note_email]
  before_action :require_login
  # GET /notes
  # GET /notes.json
  def index
    @note = Note.new
    @notes = @user.notes.order('created_at DESC')
  end

  # GET /notes/1
  # GET /notes/1.json
  def show

  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit; end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.title = @note.body[0...29] if @note.title.blank?

    respond_to do |format|
      if @note.save
        handle_successful_save(format, @note)
      else
        handle_failed_save(format, @note.errors)
      end
    end
  end

  def note_email
    NoteMailer.with(user: @user, note: @note)
              .note_email
              .deliver
    flash[:success] = 'Note sent!'
    redirect_to notes_path
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        handle_successful_update(format, @note)
      else
        handle_failed_update(format, @note.errors)
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  def set_user
    return if current_user.blank?

    @user = User.find(current_user.id)
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(
      :title,
      :body,
      :user_id
    )
  end

  def require_login
    redirect_to log_in_path if current_user.blank?
  end

  def handle_successful_save(format, note)
    format.html { redirect_to notes_url, notice: 'Note was successfully created.' }
    format.json { render :show, status: :created, location: note }
  end

  def handle_failed_save(format, errors)
    format.html { render :new }
    format.json { render json: errors, status: :unprocessable_entity }
  end

  def handle_successful_update(format, note)
    format.html { redirect_to note, notice: 'Note was successfully updated.' }
    format.json { render :show, status: :ok, location: note }
  end

  def handle_failed_update(format, errors)
    format.html { render :edit }
    format.json { render json: errors, status: :unprocessable_entity }
  end
end
