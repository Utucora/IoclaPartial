#include <stdio.h>
#include <stdint.h>

uint8_t calculate_time_jump(uint8_t currentYear, uint8_t destinationYear) {
    // TODO a: Determine the correct value of timeJump to reach destinationYear
    return destinationYear - currentYear;
    return 0;
}

void test_time_jump() {
    uint8_t currentYear = 250;
    uint8_t destinationYear = 20;
    uint8_t timeJump = calculate_time_jump(currentYear, destinationYear);

    currentYear += timeJump;
    printf("The ship has arrived in the year: %d\n", currentYear);

    if (currentYear == destinationYear) {
        printf("Mission successful! We arrived at the destination in year %d.\n", destinationYear);
    } else {
        printf("Oops! Something's wrong. We landed in year %d.\n", currentYear);
    }
}

// TODO b: Rearrange the structure to save memory
struct SpaceColony {
    uint32_t id;
    char name[17];
    char coordinates[5];
    uint8_t is_inhabited;
    uint8_t sector_type;
    char commander[8];
    double energy_reserve;
    uint16_t security_level;
    uint16_t alliance_id;
    uint32_t resource_count;
    uint8_t status_flags;
    double defense_rating;
    int *useless_entry;
};

void test_space_colony() {
    struct SpaceColony colony = {
        .id = 1,
        .name = "Alpha Centauri",
        .energy_reserve = 100.0,
        .sector_type = 1,
        .commander = "Zara",
        .security_level = 3,
        .is_inhabited = 1,
        .resource_count = 120,
        .coordinates = "A3",
        .alliance_id = 42,
        .status_flags = 0xFF,
        .defense_rating = 5.5
    };

    printf("Memory used by colony: %zu bytes\n", sizeof(colony));
}

// TODO c: Implement the function using ONLY goto and if (no for, while)
void detect_anomalies(int16_t* signals, uint8_t length, uint8_t* anomalies) {
    *anomalies = 0;
loop:
    length--;
    //printf("%d ", length);
    if(length == 0)
        goto ending;
    if (signals[length-1] < 0)
        (*anomalies)++;
    if (signals[length-1] > 100)
        (*anomalies)++;
    goto loop;

ending:
    printf("%d\n", *anomalies);
    return;
}

void test_detect_anomalies() {
    int16_t signals[] = {50, 75, -30, 120, 60, -10, 200, 45};
    uint8_t anomalies = 0;
    detect_anomalies(signals, 8, &anomalies);
    printf("Anomalies detected: %d\n", anomalies);
}

int main() {
    test_time_jump();
    test_space_colony();
    test_detect_anomalies();
    return 0;
}
