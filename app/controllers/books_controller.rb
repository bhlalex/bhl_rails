require 'jquery-rails'
require "rexml/document"

class BooksController < ApplicationController
  def index
    @search_criteria = "*:*"
  end
  
  def show
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    search = rsolr.select :params => { :q => "vol_jobid:" + params[:id]}
    @book = search['response']['docs'][0]
    @thumb = "volumes/#{params[:id]}/thumb.jpg"
    @page_title = @book['bok_title'][0]
    @tabs = {:brief => I18n.t(:brief), :mods => I18n.t(:mods), :bibtex => I18n.t(:bibtex), :endnote => I18n.t(:endnote)}
    @current = params[:tab] != nil ? params[:tab] : 'brief' 
    if @current == 'brief'
      #Hash types holds some of the metadata "types" of a book 
      #(in particularly, the types that are saved in arrays in solr indexing)
      @types = {:author => I18n.t(:book_author_title), 
                :geo_location => I18n.t(:book_location_title),
                :subject => I18n.t(:book_subject_title),
              }      
    elsif @current == 'mods'
      mods = Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id).mods
      mods.slice!(0) if mods[0] == "?" # This should remove leading "?" from mods
      
      # this is used to beautify xml display 
      doc = REXML::Document.new mods
      out = ""
      doc.write(out, 1)
      @format = out
    else
      @format = 'empty for now'
    end
    render layout: 'books_details'
  end
end