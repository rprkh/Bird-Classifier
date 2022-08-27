file_input = open('labels.txt', 'r')

number = []
lines = [line.title() for line in file_input]

for i in range(len(lines)):
    number.append(i)

class_label = [str(line_no) for line_no in number]

number_and_label = {}

for i in range(len(lines)):
    number_and_label.update({class_label[i]: lines[i]})

with open('labels.txt', 'w') as output_file:
    for key, value in number_and_label.items():
        output_file.write('%s %s' % (key, value))