require 'cartographer/cartographer'
require 'cartographer/header'
require 'cartographer/gmap'
require 'cartographer/gad'
require 'cartographer/gicon'
require 'cartographer/gmarker'
require 'cartographer/infowindow'
require 'cartographer/cluster_icon'
require 'cartographer/gpolyline'

Cartographer
Cartographer::Header
Cartographer::Gmap

ActionController::Base.send :include, Cartographer if defined?(ActionController)
ActiveRecord::Base.send     :include, Cartographer if defined?(ActiveRecord)
ActionView::Base.send       :include, Cartographer if defined?(ActionView)
