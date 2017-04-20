function [frequency,seconds] = ParseXMLFile()
    xDoc = xmlread('Properties.xml');
    frequency = xDoc.item(0).getElementsByTagName('frequency');
    frequency = frequency.item(0).getFirstChild.getData;
    frequency = str2double(frequency);
    seconds = xDoc.item(0).getElementsByTagName('seconds');
    seconds = seconds.item(0).getFirstChild.getData;
    seconds = str2double(seconds);
end