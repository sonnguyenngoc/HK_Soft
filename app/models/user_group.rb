class UserGroup < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    
    def permissions
        permission.present? ? JSON.parse(permission) : {}
    end
    
    def ability(model, action)
        (permissions[model].present? and permissions[model][action].present?) ? permissions[model][action] : ['no']
    end
    
    def self.permission_classes
        [
            {
                class_name: "Area",
                display_name: I18n.t(:area),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "HotelArea",
                display_name: I18n.t(:hotel_area),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Tour",
                display_name: I18n.t(:tour),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "TourEvent",
                display_name: I18n.t(:tour_event),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false}
                        ]
            },
            {
                class_name: "TourGroup",
                display_name: I18n.t(:tour_group),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Hotel",
                display_name: I18n.t(:hotel),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Car",
                display_name: I18n.t(:car),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Visa",
                display_name: I18n.t(:visa),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Country",
                display_name: I18n.t(:country),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "BookingCar",
                display_name: I18n.t(:booking_car),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "BookingHotel",
                display_name: I18n.t(:booking_hotel),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "QuickBookingHotel",
                display_name: I18n.t(:quick_booking_hotel),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "BookingPlane",
                display_name: I18n.t(:booking_plane),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "BookingTour",
                display_name: I18n.t(:booking_tour),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "BookingVisa",
                display_name: I18n.t(:booking_visa),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Category",
                display_name: I18n.t(:category),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Manufacturer",
                display_name: I18n.t(:manufacturer),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "ArticleCategory",
                display_name: I18n.t(:article_category),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Article",
                display_name: I18n.t(:article),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no","own","not_own", "not_approved"], multiple: true},
                            {name: "delete", values: ["yes","no","own","not_own", "not_approved"], multiple: true},
                            {name: "approve", values: ["yes","no","own","not_own"], multiple: true},
                        ]
            },
            {
                class_name: "Slideshow",
                display_name: I18n.t(:slideshow),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Gallery",
                display_name: I18n.t(:gallery),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Contact",
                display_name: I18n.t(:contact),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "User",
                display_name: I18n.t(:user),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "UserGroup",
                display_name: I18n.t(:user_group),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
            {
                class_name: "Company",
                display_name: I18n.t(:company),
                actions: [
                            {name: "read", values: ["yes","no"], multiple: false},
                            {name: "create", values: ["yes","no"], multiple: false},
                            {name: "update", values: ["yes","no"], multiple: false},
                            {name: "delete", values: ["yes","no"], multiple: false},
                        ]
            },
        ]
    end
end
