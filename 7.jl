using HorizonSideRobots

function number_7!(r::Robot)
    n = 0
    side = Ost
    while isborder(r, Nord)
        n += 1
        moves!(r, side, n)
        side = inverse(side)
    end
end

inverse(side::HorizonSide)=HorizonSide((Int(side)+2)%4)
