using HorizonSideRobots

function lower_left_corner(r::Robot)
    while !(isborder(r, Sud) && isborder(r, West))
        if !isborder(r, Sud)
            move!(r, Sud)
        end
        if !isborder(r, West)
            move!(r, West)
        end
    end
end

function canvas_center(r::Robot)
    y = 0
    x = 0 
    lower_left_corner(r)
    while !isborder(r, Nord)
        move!(r, Nord)
        y += 1
    end
    y = round(y / 2)

    while !isborder(r, Ost)
        move!(r, Ost)
        x += 1
    end
    x = round(x / 2)
    while x != 0
        move!(r, West)
        x -= 1
    end
    while y != 0
        move!(r, Sud)
        y -= 1
    end
end

function cross(r::Robot)
    x = 0
    y = 0
    canvas_center(r)
    while !isborder(r, Nord)
        move!(r, Nord)
    end
    putmarker!(r)
    while !isborder(r, Sud)
        move!(r, Sud)
        putmarker!(r)
        y += 1
    end
    y = round(y / 2)
    while y != 0 
        move!(r, Nord)
        y -= 1
    end
    while !isborder(r, West)
        move!(r, West)
    end
    putmarker!(r)
    while !isborder(r, Ost)
        move!(r, Ost)
        putmarker!(r)
        x += 1
    end
    x = round(x / 2)
    while x!= 0
        move!(r, West)
        x -= 1
    end
end
