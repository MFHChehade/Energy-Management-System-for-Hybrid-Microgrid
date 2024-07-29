% 1. Setup - MATLAB includes most required functions natively
Hour = (0:8783)';  % Create a column vector for hours
T = table(Hour);  % Create a table

% 2. Add datetime column
dates = datetime(2020,1,1,0,0,0) + hours(0:8783)';
T.date = dates;

% 3. Hour of the Day
T.HourOfDay = mod(T.Hour, 24);

% 4. Generate Random Sequence
L = zeros(8784,1);
x = ceil(normrnd(9,3));  % Generate initial random hour
for i = 2:8783
    L(i) = 0;
    if i == x
        L(i) = 1;
        x = ceil(normrnd(9+i, 3));  % Generate next target hour
    end
end
T.EDL = L;  % Add this sequence to the table

% 5. Reshape and Create New Table
EDL_array = reshape(L, [366, 24]);
EDL_table = array2table(EDL_array);

% 6. Save to CSV File
writetable(EDL_table, 'Data/EDL.csv', 'WriteVariableNames', false);
