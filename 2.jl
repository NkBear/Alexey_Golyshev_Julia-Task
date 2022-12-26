using HorizonSideRobots

function lower_left_corner(r::Robot)
    x = 0
    y = 0
    while !(isborder(r, Sud) && isborder(r, West))
        if !isborder(r, Sud)
            move!(r, Sud)
            y += 1
        end
        if !isborder(r, West)
            move!(r, West)
            x += 1
        end
    end
    perimetr(r)
    while x!=0
        move!(r, Ost)
        x -= 1
    end
    while y!=0
        move!(r, Nord)
        y -= 1
    end
end

function perimetr(r::Robot)
    while !isborder(r, Nord)
        move!(r, Nord)
        putmarker!(r)
    end
    while !isborder(r, Ost)
        move!(r, Ost)
        putmarker!(r)
    end
    while !isborder(r, Sud)
        move!(r, Sud)
        putmarker!(r)
    end
    while !isborder(r, West)
        move!(r, West)
        putmarker!(r)
    end
end
