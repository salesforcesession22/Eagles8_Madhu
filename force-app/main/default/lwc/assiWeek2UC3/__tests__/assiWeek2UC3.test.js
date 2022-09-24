import { createElement } from 'lwc';
import AssiWeek2UC3 from 'c/assiWeek2UC3';

describe('c-assi-week2-u-c-3', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-assi-week2-u-c-3', {
            is: AssiWeek2UC3
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});