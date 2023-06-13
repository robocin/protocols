# vision

A collection of messages related to RobôCIn's vision system.

## Table of Contents

- [`ball`](#ball)
- [`field`](#field)
- [`frame`](#frame)
- [`robot`](#robot)

<a name="ball"></a>

## [`ball`](ball.proto)

A collection of messages related to the ball.

- `Ball`: a message containing the ball's position and velocity. Also contains the ball's kick status when it is
  detected.

<a name="field"></a>

## [`field`](field.proto)

A collection of messages related to the field.

- `Field`: a message containing the field's dimensions.

<a name="frame"></a>

## [`frame`](frame.proto)

A collection of messages related to the frame.

- `Frame`: a message containing the frame's timestamp, optionally the field's dimensions, and the robots and ball
  detected in the frame.

<a name="robot"></a>

## [`robot`](robot.proto)

A collection of messages related to the robots.

- `Robot`: a message containing the robot's id, color, position, orientation, and velocity.
