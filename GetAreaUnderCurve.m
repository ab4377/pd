function [newValues] = GetAreaUnderCurve(values)
    newValues = zeros(size(values));
    currentValue = 0;
    for i=2:size(values)
        deltaVelocity = GetTrapezoidArea(values(i-1),values(i),1);
        currentValue = currentValue + deltaVelocity;
        newValues(i) = currentValue;
    end
end
