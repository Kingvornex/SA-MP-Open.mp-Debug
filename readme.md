// OnUnoccupiedVehicleUpdate Callback
public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat)
{
    // Vehicle Information
    new vehicle_model = GetVehicleModel(vehicleid);
    new vehicle_health = GetVehicleHealth(vehicleid);
    new vehicle_x, vehicle_y, vehicle_z;
    GetVehiclePos(vehicleid, vehicle_x, vehicle_y, vehicle_z);
    new vehicle_rotation = GetVehicleZAngle(vehicleid);
    new vehicle_speed = GetVehicleVelocity(vehicleid);
    new vehicle_color1, vehicle_color2;
    GetVehicleColor(vehicleid, vehicle_color1, vehicle_color2);
    new vehicle_locked = GetVehicleParamsEx(vehicleid, vehicle_locked, 0, 0);
    new engine_state = IsVehicleEngineOn(vehicleid);
    new lights_state = IsVehicleLightOn(vehicleid);

    // Log Vehicle Information
    printf("Vehicle ID: %d, Model: %d, Health: %f, Position: (%.2f, %.2f, %.2f), Speed: %.2f, Rotation: %.2f, Color: %d, %d, Locked: %d, Engine: %d, Lights: %d",
           vehicleid, vehicle_model, vehicle_health, vehicle_x, vehicle_y, vehicle_z, vehicle_speed, vehicle_rotation, vehicle_color1, vehicle_color2, vehicle_locked, engine_state, lights_state);

    // Player Information
    new player_name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, player_name, sizeof(player_name));
    new player_health = GetPlayerHealth(playerid);
    new player_armor = GetPlayerArmour(playerid);
    new player_x, player_y, player_z;
    GetPlayerPos(playerid, player_x, player_y, player_z);

    // Log Player Information
    printf("Player ID: %d, Name: %s, Health: %f, Armor: %f, Position: (%.2f, %.2f, %.2f)", playerid, player_name, player_health, player_armor, player_x, player_y, player_z);

    // Passenger Seat Information
    new seat_type = passenger_seat; // Use this for determining seat type or seat position.
    printf("Passenger Seat: %d", seat_type);

    return 1;
}
