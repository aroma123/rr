%%   Copyright 2013 Aroma Mahendru
%%
%%   you may not use this file except in compliance with the License.
%%   You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%%   Unless required by applicable law or agreed to in writing, software
%%   distributed under the License is distributed on an "AS IS" BASIS,
%%   See the License for the specific language governing permissions and
%%   limitations under the License.


function b =  localize(I)
s = [1; 1];
dx = [1, 1];
dy = [1; 1];
i = double(rgb2gray(I));
gx = conv2(conv2(i, dx,'same'), s,'same');
gy = conv2(conv2(i, dy,'same'), s,'same');
gradmag = (gx .^ 2 + gy .^2);
b = gradmag;
figure, imshow(b, []);
end
