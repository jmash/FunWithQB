' Program that generates the Monte Carlo Inscribed Circle Pi Simulation. In short, it generates
' an approximation of the value of pi (generally up to 2 or 3 decimal points) by calculating
' the ratio of randomly generated points that fall within the area of an inscribed circle over the
' the points that fall outside the circle.

SCREEN 12 ' dimensions are 640x480
CONST screen_width = 640
CONST screen_height = 480
CONST white = 15
CONST red = 4
CONST blue = 1
CONST pi = 3.14159

' Set title for the window
_TITLE "Monte Carlo Pi Simulation"
' Circle should be inscribed within the screen, but that would necessitate
' the circle becoming an ellipse. The radius will be locked to the height
' because it is less than the width and will allow the circle to fit
' onto the screen
CIRCLE (screen_width / 2, screen_height / 2), screen_height / 2, white

' A box should be drawn around the circle to define the boundaries
' for the simulation
PSET ((screen_width - screen_height) / 2, 0), white ' set starting point
LINE -(screen_height + ((screen_width - screen_height) / 2), 0), white
LINE -(screen_height + ((screen_width - screen_height) / 2), screen_height), white
LINE -((screen_width - screen_height) / 2, screen_height), white
LINE -((screen_width - screen_height) / 2, 0), white ' end point

' Define variables that will be used to track the number of points
' that fall within the circle, and the total number of points within
' the square
pointsInside% = 0
pointsTotal% = 0

' Draw points within the square on the screen.
FOR I = 1 TO 1000000
    ' Generate the random point (x and y values)
    randX% = ((screen_width - screen_height) / 2) + INT(RND * (screen_height)) + 1
    randY% = INT(RND * screen_height) + 1
    ' Check if the random point falls within the circle
    ' (it will always fall within the square, no check required)
    ' The easiest way to do this might be to use the distance formula
    ' to check the distance from the origin of the circle. If it's greater
    ' than the radius, then the point lies within the circle.
    IF (distance(screen_width / 2, screen_height / 2, randX%, randY%) < (screen_height / 2)) THEN
        pointsInside = pointsInside + 1
        PSET (randX%, randY%), red
    ELSE
        PSET (randX%, randY%), blue
    END IF
    pointsTotal = pointsTotal + 1
    ' Show the actual ratio of inside points to total points, and then show the result
    ' as it approaches the value of pi.
    _PRINTSTRING (0, 0), STR$(pointsInside)
    _PRINTSTRING (0, 20), STR$(pointsTotal)
    _PRINTSTRING (0, 40), STR$((pointsInside / pointsTotal) * 4)
NEXT I
SLEEP

' Distance formula
FUNCTION distance (x1%, y1%, x2%, y2%)
    distance = SQR((x2% - x1%) ^ 2 + (y2% - y1%) ^ 2)
END FUNCTION
