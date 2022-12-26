using HorizonSideRobots

function nomber18!(robot)
    recursive!(robot,Nord)
end

function recursive!(robot,side)
    move!(robot,side)
    if !isborder(robot,side)
        recursive!(robot,side)
    end
end
