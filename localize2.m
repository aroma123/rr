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


function d =  localize2(I)
[gx gy] = gradient(double(rgb2gray(I)));
gradmag = (gx .^ 2 + gy .^2);
figure, imshow(gradmag, []);
e = enhance(gradmag);
figure, imshow(e, []);
e = e./max(max(e));
e = im2bw(e,mean(mean(e)));
figure, imshow(e, []);
eg = edge(double(rgb2gray(I)), 'canny', 0.3);
figure, imshow(eg, []);
se1 = strel('line',8,0);
dil = imdilate(eg,se1,'same');
figure, imshow(dil, []);
nhood = [0,0,0,0,0,0,1,0,0,0,0,0,0; ...
    1,1,1,1,1,1,1,1,1,1,1,1,1;0,0,0,0, ...
         0,0,1,0,0,0,0,0,0];
se = strel(nhood);
op = imopen(dil,se);
figure, imshow(op,[]);
f = e .* op;
figure, imshow(f,[]);
J = project(f);
se2 = strel('line',3,90);
pro = imdilate(J,se2,'same');
se3 = strel('disk',2);
pro = imclose(pro,se3);
pro = imfill(pro, 'holes');
figure, imshow(pro,[]);
[M L] = bwlabel(pro,4);
d = majorlabels(M,L,500);
figure, imshow(d, []);
end
