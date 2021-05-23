function print_pdf(lab_count, name)
%Prints current figure handle to pdf

set(gcf,'Units', 'centimeter');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print(append('../pictures/lab', lab_count, '/', name), '-dpdf', '-painters')

end

