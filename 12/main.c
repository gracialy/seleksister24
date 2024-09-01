#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <pthread.h>
#include <unistd.h>
#include <string.h>

#define NUM_PROGRAMS 15
#define NUM_RUNS 5
#define NUM_CORES 2

pthread_mutex_t lock;

typedef struct {
    const char *command;
    char program_language[20];
    int program_index;
    double average_time;
} BenchmarkData;

// Function prototypes
double execute_program(const char *command);

void *benchmark_program(void *arg) {
    BenchmarkData *data = (BenchmarkData *)arg;
    double total_time = 0.0;

    for (int i = 0; i < NUM_RUNS; i++) {
        total_time += execute_program(data->command);
    }

    data->average_time = total_time / NUM_RUNS;
    return NULL;
}

// Execute a program and return the elapsed time
double execute_program(const char *command) {
    pthread_mutex_lock(&lock);
    clock_t start = clock();
    int result = system(command);
    clock_t end = clock();
    pthread_mutex_unlock(&lock);

    if (result != 0) {
        perror("Error executing command");
        exit(EXIT_FAILURE);
    }

    return ((double) (end - start)) / CLOCKS_PER_SEC;
}

int main() {
    system("gcc C/c.c -o C/c > NUL 2>&1");
    system("g++ Cpp/cpp.cpp -o cpp > NUL 2>&1");
    system("dotnet build Cs/cs.csproj > NUL 2>&1");
    system("dmd d.d > NUL 2>&1");
    system("gfortran -o Fortran/fortran Fortran/fortran.f90 > NUL 2>&1");
    system("javac Java/Java.java > NUL 2>&1");
    system("fpc -Sd Pascal/pascal.pas > NUL 2>&1");
    system("gcc -no-pie -o x86/x86 x86/x86.s > NUL 2>&1");

    pthread_t threads[NUM_PROGRAMS];
    BenchmarkData benchmark_data[NUM_PROGRAMS];

    const char *commands[NUM_PROGRAMS] = {
        "start C/c.exe",
        "start Cpp/cpp.exe",
        "dotnet run --project Cs/cs.csproj",
        "start D/d.exe",
        "start Fortran/fortran.exe",
        "go run Go/go.go", 
        "java -cp Java Java",
        "node Javascript/javascript.js", 
        "start Pascal/pascal.exe",
        "perl Perl/perl.pl > NUL 2>&1",
        "php PHP/php.php", 
        "py -2 Python2/python2.py", 
        "python3 Python3/python3.py", 
        "ruby Ruby/ruby.rb", 
        "start x86/x86.exe"
    };

    const char *languages[NUM_PROGRAMS] = {
        "C",
        "Cpp",
        "Cs",
        "D",
        "Fortran",
        "Go",
        "Java",
        "Javascript",
        "Pascal",
        "Perl",
        "PHP",
        "Python2",
        "Python3",
        "Ruby",
        "x86 Assembly"
    };

    // Initialize BenchmarkData
    for (int i = 0; i < NUM_PROGRAMS; i++) {
        benchmark_data[i].command = commands[i];
        strncpy(benchmark_data[i].program_language, languages[i], sizeof(benchmark_data[i].program_language) - 1);
        benchmark_data[i].program_language[sizeof(benchmark_data[i].program_language) - 1] = '\0';
        benchmark_data[i].program_index = i;
        printf("Benchmarking %s ...\n", benchmark_data[i].program_language);
    }

    // Create threads for each program
    for (int i = 0; i < NUM_PROGRAMS; i++) {
        pthread_create(&threads[i], NULL, benchmark_program, &benchmark_data[i]);
    }

    // Wait for all threads to finish
    printf("================================================\n");
    for (int i = 0; i < NUM_PROGRAMS; i++) {
        pthread_join(threads[i], NULL);
        printf("Program %d (%s) average time: %.6f seconds\n", 
            benchmark_data[i].program_index + 1, 
            benchmark_data[i].program_language, 
            benchmark_data[i].average_time);
    }

    return 0;
}
